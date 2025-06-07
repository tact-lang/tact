struct SubOpt {
  val: Int?; // implicit default null
}

contract OuterOptImplicit {
  s: SubOpt = SubOpt{ val: null };
}