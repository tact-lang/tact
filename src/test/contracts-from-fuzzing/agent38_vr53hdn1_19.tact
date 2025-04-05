struct Many { one: Int; two: Int; three: Int; fans: Int; }

contract TestDestructuringRest {
    receive() {
        // Using the rest operator .. to ignore fields other than 'fans'
        let Many { fans, .. } = Many { one: 10, two: 20, three: 30, fans: 40 };
        dump(fans); // Expect output: 40
    }
}
