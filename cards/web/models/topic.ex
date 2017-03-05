defmodule Cards.Topic do
    use Cards.Web, :model

    schema "topics" do # to tell phoenix what to expect inside postgres
        field :title, :string
    end

    # Validate Model before inserted into database
    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title])
        |> validate_required([:title])
    end

end
