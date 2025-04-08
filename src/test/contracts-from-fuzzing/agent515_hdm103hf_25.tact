// Stress test large optional fields
struct BigOptional {
    opt1: Int?; opt2: Int?; opt3: Int?;
    opt4: Bool?; opt5: Bool?; opt6: Bool?;
    opt7: String?; opt8: String?; opt9: String?;
}

contract BigOptContract {
    data: BigOptional?;

    init() {
      self.data = null;
    }
}
