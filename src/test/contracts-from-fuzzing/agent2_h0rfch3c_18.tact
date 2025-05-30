///////////////////////////////
// Test 18: Destructuring a struct with discard using wildcard in field binding (allowed as per docs)

struct MyStruct {
    a: Int;
    b: Int;
}

contract Test {
    receive() {
         let s: MyStruct = MyStruct { a: 10, b: 20 };
         // According to docs, discard the field 'a' and bind 'b' to variable y using _
         let MyStruct { a: _, b: y } = s;
         dump(y);
    }
}
