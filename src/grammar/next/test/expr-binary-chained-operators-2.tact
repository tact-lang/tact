contract Foo {
    a: Int as coins = 123 + -456 + +(987 * -654);
    b: Int as coins = 123 + -456 - -(987 / +654);
}