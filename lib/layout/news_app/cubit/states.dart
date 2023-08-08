abstract class new_app_states {}

class news_intial_state extends new_app_states{}

class bottom_navig_state extends new_app_states{}
class change_navig_bar_state extends new_app_states {}

class loading_bus_state extends new_app_states {}
class sucess_load_bus_state extends new_app_states {}
class fail_load_bus_state extends new_app_states {
  late final String error;
  fail_load_bus_state(error);

}

class loading_spo_state extends new_app_states {}
class sucess_load_spo_state extends new_app_states {}
class fail_load_spo_state extends new_app_states {
  late final String error;
  fail_load_spo_state(error);

}

class loading_sci_state extends new_app_states {}
class sucess_load_sci_state extends new_app_states {}
class fail_load_sci_state extends new_app_states {
  late final String error;
  fail_load_sci_state(error);

}

class loading_sear_state extends new_app_states {}
class sucess_load_sear_state extends new_app_states {}
class fail_load_sear_state extends new_app_states {
  late final String error;
  fail_load_sear_state(error);

}


class changemode_state extends new_app_states {}
