// structs inside structs with optional fields at various depths
struct SInner {
  flag: Bool?;
}

struct SMid {
  inner: SInner;
  label: String?;
}

struct STop {
  mid: SMid;
  id: Int?;
}

contract OptsAtMultipleLevels {
  data: STop;

  init() {
    self.data = STop{
      mid: SMid{
        inner: SInner{ flag: null },
        label: null
      },
      id: null
    };
  }
}