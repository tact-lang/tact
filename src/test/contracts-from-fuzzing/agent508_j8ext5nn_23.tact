trait Base { flag: Bool }

contract Impl with Base {
    flag: Bool;
    init() { self.flag = true; }
}