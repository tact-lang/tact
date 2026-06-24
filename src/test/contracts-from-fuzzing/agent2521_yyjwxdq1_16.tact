struct EmojiHolder {
  text: String;
}

contract Emojistore {
  em: EmojiHolder;

  init() {
    self.em = EmojiHolder{ text: "Hello 🌍🚀✨🔥💎🧠" };
  }
}
