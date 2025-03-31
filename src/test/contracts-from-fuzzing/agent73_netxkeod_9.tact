struct Point { x: Int; y: Int }

contract DestructureValid2 {
    receive() {
         let p = Point { x: 10, y: 20 };
         // Correct syntax to discard the 'y' field
         let Point { x, y: _ } = p;
         dump(x);
    }
}
