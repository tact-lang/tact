struct DefaultOpt {
 x: Int? = null;
 y: Bool? = null;
 z: String? = null;
}

contract OptDefaults {
 d: DefaultOpt;

 init() {
   self.d = DefaultOpt{};
 }
}