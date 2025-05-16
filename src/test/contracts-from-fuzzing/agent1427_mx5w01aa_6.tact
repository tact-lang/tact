struct Deep {
    z: Int?;
}

struct Mid {
    y: Deep;
}

contract TestContract {
    nestedDeep: Mid = Mid{ y: Deep{ z: null } };
    receive() {
        let _ = self.nestedDeep;
    }
}