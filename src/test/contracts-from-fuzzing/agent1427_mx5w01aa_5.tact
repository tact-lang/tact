struct Deep {
    z: Int;
}

struct Mid {
    y: Deep;
}

contract TestContract {
    nestedDeep: Mid = Mid{ y: Deep{ z: 42 } };
    receive() {
        let _ = self.nestedDeep;
    }
}