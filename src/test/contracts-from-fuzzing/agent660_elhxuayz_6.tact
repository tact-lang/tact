struct LongNames {
  supercalifragilisticexpialidocious: Int;
  pneumonoultramicroscopicsilicovolcanoconiosis: Int;
  hippopotomonstrosesquipedaliophobia: Int;
}

contract LongFieldNamesTest {
  storage: LongNames;

  init() {
    self.storage = LongNames{
      supercalifragilisticexpialidocious: 1,
      pneumonoultramicroscopicsilicovolcanoconiosis: 2,
      hippopotomonstrosesquipedaliophobia: 3,
    };
  }
}