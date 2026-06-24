struct NestOpt {
  opt: InnerOpt?;
}
struct InnerOpt {
  val: Int = 5;
}
contract OptNestedTest {
  data: NestOpt = NestOpt{ opt: null };
}