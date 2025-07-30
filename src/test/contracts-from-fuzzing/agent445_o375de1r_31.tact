// Non-optional multi-level struct chain, test deepnest
struct Bottom {
  leafVal: Int;
}
struct MidLevel {
  bottom: Bottom;
}
struct TopLevel {
  mid: MidLevel;
}
contract DeepNestPlain {
  root: TopLevel = TopLevel{
    mid: MidLevel{
      bottom: Bottom{
        leafVal: 12345
      }
    }
  };
}
