struct Two { first: Int; second: Int; }

contract TestDestructuring {
    receive() {
         let t: Two = Two { first: 10, second: 20 };
         let Two { second: _, first } = t;
         dump(first);
    }
}
