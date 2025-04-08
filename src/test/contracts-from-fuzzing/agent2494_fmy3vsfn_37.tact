message(55) M55 {}
struct ContainerOpt {
  m: M55?;
}
contract OptMsgInStruct {
  f: ContainerOpt = ContainerOpt{ m: null };
}