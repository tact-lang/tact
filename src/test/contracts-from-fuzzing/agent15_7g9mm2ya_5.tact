contract A(x: Int) {
    get fun getBInit(): Cell {
        return initOf B(self.x + 1).data;
    }
}

contract B(y: Int) {
    get fun getCInit(): Cell {
        return initOf C(self.y + 1).data;
    }
}

contract C(z: Int) {
    get fun getAInit(): Cell {
        return initOf A(self.z + 1).data;
    }
}
