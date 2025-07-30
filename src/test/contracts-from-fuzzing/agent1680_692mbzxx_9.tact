struct Sub {
    x: Int as int64 = 0;
    y: Int as uint32 = 1;
    z: Int as int8 = -1;
    w: Int as int257 = 123;
}

contract SerializeNest {
    s: Sub = Sub{ x:42, y:10, z: -5, w:999 };
    receive() {}
}