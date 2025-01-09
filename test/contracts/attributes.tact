extends mutates fun fun1(self: Int, c: Int) {
    let res: Int = 1;
    repeat (c) {
        res *= self;
    }
    self = res;
}

mutates extends fun fun2(self: Int, c: Int) {
    let res: Int = 1;
    repeat (c) {
        res *= self;
    }
    self = res;
}
