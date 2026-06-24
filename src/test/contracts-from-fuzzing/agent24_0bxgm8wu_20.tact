struct Many { one: Int; two: Int; three: Int; fans: Int }

contract TestDestructuringIgnore {
    receive() {
        // Using ignore operator (..) in destructuring assignment
        let Many { fans, .. } = Many { one: 10, two: 20, three: 30, fans: 40 };
        dump(fans); // Expected output: 40
    }
}
