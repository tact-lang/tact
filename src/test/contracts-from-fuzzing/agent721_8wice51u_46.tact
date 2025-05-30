struct HasStr {
  s: String;
}

struct HasOpt {
  s: String?;
}

contract StringStructs {
  x: HasStr = HasStr{s:"x"};
  y: HasOpt = HasOpt{s:null};
}