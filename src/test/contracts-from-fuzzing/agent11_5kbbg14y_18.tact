struct Example { number: Int }

contract TestDestructuring {
    receive() {
         let Example { number } = Example { number: 42 };
         dump(number);
    }
}
