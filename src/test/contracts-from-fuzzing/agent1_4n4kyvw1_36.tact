message Defaulted {
    x: Int = 5;
    y: Bool = false;
}

contract Test {
    receive() {
        let d1 = Defaulted{};
        let d2 = Defaulted{x:10};
        let d3 = Defaulted{y:true};
    }
}