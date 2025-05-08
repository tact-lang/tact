struct ComposeNest {
 a: Int;
 b: Int?;
 c: Bool;
 d: Bool?;
 e: String;
 f: String?;
}

contract DeepCompose {
  s: ComposeNest = ComposeNest {
    a:1, b:null, c:true, d:null, e:"hi", f:null
  };
}