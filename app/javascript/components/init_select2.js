import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('select').select2({ width: '100%' });
};

export { initSelect2 };