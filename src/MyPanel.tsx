import React, { useEffect } from 'react';
import { PanelProps } from '@grafana/data';
import axios from 'axios'; // Import axios

interface Props extends PanelProps {}

export const MyPanel: React.FC<Props> = ({ options, data, width, height }) => {
  useEffect(() => {
    const handleKeyDown = async (event: KeyboardEvent) => {
      let apiUrl = '';

      switch (event.key) {
        case 'ArrowUp':
          console.log('Arrow Up pressed');
          apiUrl = 'https://www.foxnews.com/';
          break;
        case 'ArrowDown':
          console.log('Arrow Down pressed');
          apiUrl = 'https://edition.cnn.com/';
          break;
        case 'ArrowLeft':
          console.log('Arrow Left pressed');
          apiUrl = 'https://edition.cnn.com/';
          break;
        case 'ArrowRight':
          console.log('Arrow Right pressed');
          apiUrl = 'https://www.foxnews.com/';
          break;
        default:
          break;
      }

      if (apiUrl) {
        try {
          const response = await axios.get(apiUrl);
          console.log('API Response:', response.data);
        } catch (error) {
          console.error('Error calling API:', error);
        }
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, []);

  return (
    <div style={{ width, height }}>
      <p>Press the arrow keys and check the console.</p>
    </div>
  );
};
