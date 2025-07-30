struct NestOpt1 {
    x: Int?;
}
struct NestOpt2 {
    y: NestOpt1?;
}
struct NestOpt3 {
    z: NestOpt2?;
}

contract TestContract {
    triple: NestOpt3 = NestOpt3{ z: null };
}