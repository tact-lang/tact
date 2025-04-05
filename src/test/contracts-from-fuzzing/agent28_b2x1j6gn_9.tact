struct Two { first: Int; second: Int }

contract TestDestructure {
    receive() {
         let s = Two { first: 10, second: 20 };
         let Two { first, second } = s;
         dump(first + second);
    }
}
