struct One {
  id: Int;
}
struct Two {
  one: One;
}
struct Three {
  two: Two;
}
struct Four {
  three: Three;
}
struct Five {
  four: Four;
}

contract ChainFive {
  link: Five;

  init() {
    self.link = Five {
      four: Four {
        three: Three {
          two: Two {
            one: One {
              id: 4242
            }
          }
        }
      }
    };
  }
}