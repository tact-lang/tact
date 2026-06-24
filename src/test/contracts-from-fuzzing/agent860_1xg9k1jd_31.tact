struct MultiDefaults {
 a: Int=0; b: Int=1; c: Int=2; d: Int=3;
 e: Int=4; f: Int=5; g: Int=6; h: Int=7;
}

contract FieldDefs {
 p: MultiDefaults;
 init() {
   self.p=MultiDefaults{a:10,b:11,c:12,d:13,e:14,f:15,g:16,h:17};
 }
}