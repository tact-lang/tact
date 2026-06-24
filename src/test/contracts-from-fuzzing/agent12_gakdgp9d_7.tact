struct Example { number: Int }

contract TestDestruct {
    receive() {
        let e: Example = Example { number: 100 };
        let Example { number } = e;
        dump(number);
    }
}
