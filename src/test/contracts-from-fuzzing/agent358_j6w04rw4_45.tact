struct Reversed {
 s: String;
 b: Bool;
 i: Int;
}

contract ReverseOrder {
 val: Reversed;
 init() {
   self.val = Reversed{ s:"hi", b:true, i:42 };
 }
}