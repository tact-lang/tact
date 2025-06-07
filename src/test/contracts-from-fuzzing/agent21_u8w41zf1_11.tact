struct S1 {
  s2: S2;
  optS2: S2?;
}

struct S2 {
  s3: S3;
  optS3: S3?;
}

struct S3 {
  s4: S4;
  optS4: S4?;
}

struct S4 {
  val: Int;
  flg: Bool?;
}

contract FourLevelChain {
  chain: S1;

  init() {
    self.chain = S1{
      s2: S2{
        s3: S3{ s4: S4{ val: 10, flg: null }, optS4: null },
        optS3: null },
      optS2: null };
  }

  receive() {}
}