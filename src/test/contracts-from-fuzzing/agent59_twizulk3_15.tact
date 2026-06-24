struct Many { one: Int; two: Int; three: Int; fans: Int }

contract TestDestructuring {
    receive() {
        // Destructure the struct and ignore all fields except 'fans'
        let Many { fans, .. } = Many { one: 1, two: 2, three: 3, fans: 4 };
        dump(fans);
    }
}
