import { configure } from 'enzyme';
import Adapter from '@wojtekmaj/enzyme-adapter-react-17';
import { Settings } from 'luxon';
configure({ adapter: new Adapter() }); // required to use MUI snapshot renderer

jest.useFakeTimers();
jest.mock('lodash/debounce', () => jest.fn(fn => fn));

global.document.createRange = () => ({
  setStart: () => {},
  setEnd: () => {},
  commonAncestorContainer: {
    nodeName: 'BODY',
    ownerDocument: document,
  },
});

global.IntersectionObserver = class IntersectionObserver {
  constructor() {}
  disconnect() {
    return null;
  }
  observe() {
    return null;
  }
  takeRecords() {
    return null;
  }
  unobserve() {
    return null;
  }
};

Settings.defaultZoneName = 'Europe/Zurich'; // tests can be run in different timezone
