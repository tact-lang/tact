struct DefaultsOpt {
 a: Int?;
 b: Bool?;
 s: String?;
}

contract OptDefaults {
 data: DefaultsOpt;

 init() {
   self.data = DefaultsOpt{
     a: null,
     b: null,
     s: null,
   };
 }
}