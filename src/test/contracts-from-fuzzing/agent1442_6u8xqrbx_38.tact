// fuzz: numerous nested structs with interleaved optionals, defaults, serialization annotations
struct S4 { b:Bool?; }
struct S3 { inner:S4 = S4{b:null}; x:Int as int8; }
struct S2 { inner:S3; y:Int?=null; }
struct S1 { inner:S2; flag:Bool=true; }

contract TestContract {
 s:S1;
 init() {
   self.s=S1{inner:S2{inner:S3{inner:S4{b:null},x:7}}};
 }
}