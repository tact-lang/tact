struct Many { one: Int; two: Int; three: Int; fans: Int }

contract TestDestructuringIgnore {
    receive() {
         let Many { fans, .. } = Many { one: 1, two: 2, three: 3, fans: 4 };
         dump(fans);
    }
}
