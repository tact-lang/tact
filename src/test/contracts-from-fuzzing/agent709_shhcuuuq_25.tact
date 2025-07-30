struct Info {
  s: String = "hi";
  addr: Address = address("UQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p9dz");
}

contract TestContract {
  info: Info = Info{};
}