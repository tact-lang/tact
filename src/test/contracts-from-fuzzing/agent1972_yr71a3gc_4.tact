struct Coord {
  lat: Int;
  lon: Int;
  label: String?;
}

contract Geo {
  pos1: Coord;
  pos2: Coord;
  pos3: Coord?;
  note: String?;
  flag: Bool;
  count: Int;

  init() {
    self.pos1 = Coord{ lat: 10, lon: 20, label: null };
    self.pos2 = Coord{ lat: 30, lon: 40, label: "here" };
    self.pos3 = null;
    self.note = "start";
    self.flag = true;
    self.count = 0;
  }
}