struct C1 {
 a: Int;
}
struct C2 {
 b: Bool;
}

contract SeveralVars {
 first: C1;
 second: C2;
 third: C1;
 last: C2;

 init() {
    self.first = C1{a:1};
    self.second = C2{b:true};
    self.third = C1{a:5};
    self.last = C2{b:false};
 }
}