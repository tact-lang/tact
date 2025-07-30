///////////////////////////////
// Test 19: Destructuring with discard using ".." to ignore extra fields

struct Many {
    one: Int;
    two: Int;
    three: Int;
    fans: Int;
}

contract Test {
    receive() {
         let s: Many = Many { one: 1, two: 2, three: 3, fans: 4 };
         // Discard all fields except 'fans' using the .. operator
         let Many { fans, .. } = s;
         dump(fans); // Expected to dump 4
    }
}
