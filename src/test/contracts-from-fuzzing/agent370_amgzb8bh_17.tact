struct X {
 a: Int;
 b: Bool;
 c: String;
}
contract Mix {
 f_int: Int;
 f_bool: Bool;
 f_str: String;
 f_opt_int: Int?;
 f_opt_bool: Bool?;
 f_opt_str: String?;
 f_struc: X;

 init() {
  self.f_int = 7;
  self.f_bool = true;
  self.f_str = "hi";
  self.f_opt_int = null;
  self.f_opt_bool = null;
  self.f_opt_str = null;
  self.f_struc = X{a:1,b:false,c:"c"};
 }
}