defmodule Cards do
@moduledoc """
Provides methods for creating and handling a deck of cards
"""
@doc """
Returns a list of strings reperesenting a deck of playing cards
"""
  def create_deck do
  values =["Ace", "two", "three", "Four", "Five"]
  suits = ["Spades", "Clubs", "Hearts", "Diamond"]

  for suit <- suits, value <- values do
  "#{value} of #{suit}"
  end
  end
  
  def shuffle(deck) do
  Enum.shuffle(deck)
  end

  @doc """
  Determines whether a deck contains a given card
  ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true
  """
  def contains?(deck, card) do
  Enum.member?(deck, card)

  end

  @doc """
  this returns a handful
  the `hand_size` is the size of the deck we want

  ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
  Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
  binary = :erlang.term_to_binary(deck)
  File.write(filename, binary)
  end

  def load(filename) do
  
  case File.read(filename) do
  {:ok, binary} -> :erlang.binary_to_term binary
  {:error, _reason} -> "thtat file doesn't exisit"
  end
  end

  def create_hand(hand_size) do
  Cards.create_deck
  |> Cards.shuffle
  |> Cards.deal(hand_size)
  end
end
