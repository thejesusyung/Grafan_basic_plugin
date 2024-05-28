import { PanelPlugin } from '@grafana/data';
import { MyPanel } from './MyPanel';

export const plugin = new PanelPlugin(MyPanel);
