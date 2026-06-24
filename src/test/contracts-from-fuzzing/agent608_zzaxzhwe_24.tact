// struct with many optional fields assigned null explicitly
struct Ops {
 o1:Int?;
 o2:Int?;
 o3:Int?;
 o4:Int?;
 o5:Int?;
}
contract Test {
 ops:Ops=Ops{
  o1:null,
  o2:null,
  o3:null,
  o4:null,
  o5:null
 };
}
