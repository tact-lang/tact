fun test_fun(): Int {
    let a: Int = 123;
    let b: Int = -123;
    let c: Int = 1_0123_00_000;
    let d: Int = 0x123;
    let e: Int = -0x123;
    let f: Int = 0x1_0123_00_000;
    let g: Int = 0b101010;
    let h: Int = -0b101010;
    let i: Int = 0b1_0101_00_000;
    let j: Int = 0o123;
    let k: Int = -0o123;
    let l: Int = 0o1_0123_00_000;
    return a + b + c + d + e + f + g + h + i + j + k + l;
}