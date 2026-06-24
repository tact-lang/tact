struct Example { number: Int }

contract TestDestructuringValid {
    receive() {
        let Example { number } = Example { number: 42 };
        dump(number);
    }
}
