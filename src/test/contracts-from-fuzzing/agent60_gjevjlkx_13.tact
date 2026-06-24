struct Example { number: Int }

contract TestDestruct {
    receive() {
       let Example { number } = Example { number: 42 };
       dump(number);
    }
}
