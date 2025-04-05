struct Inner {
    value: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract Test {
    receive() {
         let o: Outer = Outer{
             middle: Middle{
                 inner: Inner { value: 42 }
             }
         }; 
    }
}
