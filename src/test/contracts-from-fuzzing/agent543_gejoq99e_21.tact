struct S {
 x: Int;
 y: Bool;
 z: String;
}

contract DiffDefaults {
 data: S;

 init() {
   self.data = S{x:0,y:false,z:""};
 }
}
