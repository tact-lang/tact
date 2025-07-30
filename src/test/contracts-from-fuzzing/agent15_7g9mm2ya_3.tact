contract F {
    init() { }
}

contract E {
    get fun getFData() : Cell {
        return initOf F().data;
    }
}

contract D {
    get fun getEData() : Cell {
        return initOf E().data;
    }
}
