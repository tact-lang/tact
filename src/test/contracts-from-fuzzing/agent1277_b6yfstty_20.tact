struct MultipleOptionals {
 a: Int?;
 b: Int?;
 c: Int?;
 d: Int?;
 e: Int?;
}

contract TestContract {
 vals: MultipleOptionals;
 init() {
   self.vals = MultipleOptionals{a:null, b:null, c:null, d:null, e:null};
 }
}