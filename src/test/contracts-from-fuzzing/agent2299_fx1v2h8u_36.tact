struct Info {
  nested: Int?;
}

contract OptStructInit {
  s: Info = Info {
    nested: null
  };
}