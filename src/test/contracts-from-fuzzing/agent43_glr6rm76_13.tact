struct Example { number: Int }

contract TestDestructuring {
    receive() {
        let e: Example = Example { number: 33 };
        let Example { number } = e;
        dump(number);
    }
}
