struct S {
 x: Int?;
 y: Bool?;
 z: String?;
}

contract OptionalMany {
 val: S;

 init() {
   self.val = S{
     x: null,
     y: null,
     z: null
   };
 }
}