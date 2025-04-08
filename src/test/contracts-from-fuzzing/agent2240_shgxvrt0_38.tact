struct DeepS {
 x:Int;
}
struct D2 {
 inner:DeepS;
}
struct D3 {
 inner:D2;
}
struct D4 {
 inner:D3;
}
struct D5 {
 inner:D4;
}
struct D6 {
 inner:D5;
}
contract VeryDeepStruct {
 field:D6;
 init() {
 self.field=D6{inner:D5{inner:D4{inner:D3{inner:D2{inner:DeepS{x:1}}}}}};
 }
}