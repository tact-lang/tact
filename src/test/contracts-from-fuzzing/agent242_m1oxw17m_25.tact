struct OptionalAndPrimitive {
 a: Int?;
 b: Bool?;
 c: String?;
 d: Address?;
 e: Int;
 f: Bool;
 g: String;
 h: Address;
}

contract MixedOptAndPrim {
 m: OptionalAndPrimitive;

 init() {
   self.m = OptionalAndPrimitive{
     a: null, b: null, c: null, d: null,
     e: 1, f: true, g: "hi", h: myAddress(),
   };
 }
}