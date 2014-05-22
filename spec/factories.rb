FactoryGirl.define do
	factory :user do
		name	"Bryan Benson"
		email	"bbenson@cipherhealth.com"
		password "foobar"
		password_confirmation "foobar"
	end
end